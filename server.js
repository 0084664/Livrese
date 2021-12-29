function BD() 
{
    process.env.ORA_SDTZ = 'UTC-3'; // garante horário de Brasília

    this.getConexao = async function () 
    {
        if (global.conexao)
            return global.conexao;

        // isso aqui não é necessário se tudo for instalado corretamente
        const oracledb = require('oracledb');
        try {
            oracledb.initOracleClient({ libDir: 'instantclient_19_11' });
        } catch (err) {
            console.error(err);
            process.exit(1);
        }
        // -------

        const dbConfig = require('./dbconfig.js');

        try {
            global.conexao = await oracledb.getConnection(dbConfig);
        }
        catch (erro) {
            console.log('Não foi possível estabelecer conexão com o BD!');
            process.exit(1);
        }

        return global.conexao;
    }
}

function Comunicado (codigo,mensagem,descricao)
{
    this.codigo    = codigo;
    this.mensagem  = mensagem;
    this.descricao = descricao;
}
// construtor de cadastro
function Cadastro(nome, idade){
   
    this.nome = nome;
    this.idade = idade;
}

function Cadastros(bd){
    this.bd = bd;

        this.inclua = async function (cadastrado) {
            const conexao = await this.bd.getConexao();

            const sql1 = 'INSERT INTO Cadastros (Nome,idade) VALUES (:0,:1)';
            const dados = [cadastrado.nome, cadastrado.idade];
            await conexao.execute(sql1, dados);

            const sql2 = 'COMMIT';
            await conexao.execute(sql2);

        this.recupereUm = async function (cadastro) {
            const conexao = await this.bd.getConexao();

            const sql = 'SELECT * FROM Cadastros WHERE email=:0';
            const dados = [cadastro.email];
            const ret = await conexao.execute(sql,dados);

            return ret.rows;
        }
        
        this.remova = async function (matricula) {
            const conexao = await this.bd.getConexao();

            const sql1 = 'DELETE FROM Cadastros WHERE Email=:0';
            const dados = [cadastro.email];
            await conexao.execute(sql1, dados);

            const sql2 = 'COMMIT';
            await conexao.execute(sql2);
        }
    }
}

function middleWareGlobal(req, res, next) {
    console.time('Requisição'); // marca o início da requisição
    console.log('Método: ' + req.method + '; URL: ' + req.url); // retorna qual o método e url foi chamada

    next(); // função que chama as próximas ações

    console.log('Finalizou'); // será chamado após a requisição ser concluída
    console.log("Defeito? \r");
        console.log(JSON.stringify(defeito));
    console.timeEnd('Requisição'); // marca o fim da requisição
}

var defeito = new Comunicado;
async function inclusao(req, res) {
    if (!req.body.nome || !req.body.idade ) {
        const erro1 = new Comunicado('DdI', 'Dados Incompletos', 'Não foram informados todos os dados para efetuar o cadastro.');
        defeito = erro1;
        return res.status(422).json(erro1);
    }
    
    /*try{
        var cadastro = new Cadastro(req.body.nome, req.body.idade);
    } catch(erro){
        const erro3 = new Comunicado('EMI', erro, 'O email utilizado é inválido.')
        return res.status(406).json(erro3);
    }*/
    
        const cadastro = new Cadastro(req.body.nome, req.body.idade);

    try {
        await global.cadastros.inclua(cadastro);
        const sucesso = new Comunicado('IBS', 'Inclusão Bem Sucedida', 'O Cadastro foi um sucesso.');
        defeito = sucesso;
        return res.status(201).json(sucesso);
    }
    catch (erro) {
        numeracao = erro.errorNum;

        var erros;
        
        switch(numeracao){
            //case 1: 
                //erros = new Comunicado('EJU', 'Email Já Utilizado', 'O email informado já foi utilizado e não pode ser repetido.');
            case 12899: 
                erros = new Comunicado('DMG', 'Dados Muitos Grandes', 'Os dados informados são maiores do que o tamanho permitido. A senha pode ter até 40 caracteres.');
            default: 
                erros = new Comunicado('ENI', 'Erro Não Identificado', erro);
        }   
            const erro2 = erros;
            defeito = erro2;
        return res.status(409).json(erro2);
    }
}

async function remocao(req, res) {
    if (req.body.nota || req.body.freq) {
        const erro1 = new Comunicado('JSP', 'JSON Sem Propósito', 'Foram disponibilizados dados em um JSON sem necessidade');
        return res.status(422).json(erro1);
    }

    const cadastro = new Cadastro(req.params.ra,req.params.cod);

    let ret;
    try {
        ret = await global.matriculas.recupereUm(matricula);
    }
    catch (erro) { }

    if (ret.length == 0) {
        const erro2 = new Comunicado('ANE', 'Aluno inexistente', 'Não há aluno cadastrado com o código informado');
        return res.status(404).json(erro2);
    }
    else {
        try {
            await global.matriculas.remova(matricula);
        }
        catch (erro) {
            console.log(erro);
         }

        const sucesso = new Comunicado('RBS', 'Remoção bem sucedida', 'O Aluno foi removido com sucesso');
        return res.status(200).json(sucesso);
    }
}

async function ativacaoDoServidor() {
    const bd = new BD();
    global.cadastros = new Cadastros(bd);

    const express = require('express');
    const app = express();

    app.use(express.json());   // faz com que o express consiga processar JSON
    app.use(middleWareGlobal); // app.use cria o middleware global

    app.put('/cadastros', inclusao);
    app.delete('/matriculas/:cod/:ra', remocao);

    console.log('Servidor ativo na porta 5000...');
    app.listen(5000);
}
ativacaoDoServidor();