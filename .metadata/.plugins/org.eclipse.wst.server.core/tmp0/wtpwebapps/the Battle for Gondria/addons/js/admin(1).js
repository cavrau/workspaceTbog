/*Função que faz a validação do cadastro*/
validaCadastro= function(){
    if(validaCampo('#nome')&&validaCampo('#nickname')&&validaCampo('#nascimento')&&validaCampo('#senha')&&validaCampo('#email')&&validaCampo('#confirmaSenha')&&validaCampo('#confirmaEmail')){

        if (($('#email').val()==$('#confirmaEmail').val())){

            if ($('#confirmaSenha').val()==$('3senha').val()){
                return true;
            }else{
                alert("Os campos de senha não tem o mesmo valor");
                $('#confirmaSenha').focus();
                return false;
            }
        }else{
            alert("Os campos de e-mail não tem o mesmo valor");
            $('#confirmaEmail').focus();
            return false;
        }
    }else
        return false;
}

/*Função que faz a atualização dos dados do jogador */
validaPerfil = function() {
    //linha abaixo valida se todos os campos menos os de nova senha e confirmação preeenchidos
    if(validaCampo('#nicknameUpdate')&&validaCampo('#nomeUpdate')&&validaCampo('#emailUpdate')&&validaCampo('#nascimentoUpdate')){
            if(validaCampo('#senha')){
            // linha abaixo valida se os campos de nova senha est~ao preenchidos
                if(validaCampo('#novaSenha')&&validaCampo('#confirmaSenha')){
                    if($('#novaSenha').val() == $('#confirmaSenha').val()){
                        return true;
                    }else{
                        alert("Os campos de nova senha não tem os mesmo valor");
                        $('#novaSenha').focus();
                        return false;
                    }
                }
            return false;
        }else{
            $('#senha').focus();
            return false;
        }
    }else{
        return false;
    }
}

/*Função que faz a validação dos campos vazios*/
validaCampo = function(nome){
    if($(nome).val()==""){
        $(nome).focus();
        return false;
    }else{
        return true;
    }
}

/*Função que mostra o nome do jogador a ser banido ao 
admin que vai bani-lo o jogo */
var nickBan = "";
$(document).ready(function(){
    $("#btn_excluir").click(function(){
        nickBan = $("#td_BanNick").text();
        $("#div_banidoPor").html("<h6 id='h6_jogadorBanido'>Deseja excluír o jogador " + nickBan + " por:</h6>");
    });
});