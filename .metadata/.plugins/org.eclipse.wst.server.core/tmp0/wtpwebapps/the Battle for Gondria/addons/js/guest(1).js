/*Carregamento dinâminco*/
$(document).ready( function(){
carregaPagina= function(){
    var pagename = window.location.search.substring(1);  
    if (pagename==''){
        pagename='main';
    }  
    $('#content').load('system/guest/'+pagename+'.html'), function(response, status, info) {
        if (status == "error") {
            var msg = "Houve um erro ao encontrar a página: "+ info.status + " - " + info.statusText;
            $("#content").html(msg);
            }
        }
    }
    carregaPagina();
}
);

/*Função que faz a validação do cadastro e chama a servlet para o cadastro do jogador*/
cadastro = function(){
	var obiWan = "Hello there - 0"; 
	console.log(obiWan);
    if(validaCampo('#nome')&&validaCampo('#nickname')&&validaCampo('#nascimento')&&validaCampo('#senha')&&validaCampo('#email')&&validaCampo('#confirmaSenha')&&validaCampo('#confirmaEmail')){
    	console.log("hello there - 1");

        if (($('#email').val()==$('#confirmaEmail').val())){
        	console.log("hello there - 2");
            if ($('#confirmaSenha').val()==$('#senha').val()){
            	console.log("hello there - 3");
            	
            	$.ajax({
            		type: "POST",
            		url: "CadastraUsuario",
            		data: $("#cadastraForm").serialize()+"&txt_fruta=SDFHBSDFABACAXIGHJRW67U356",
            		success: function(msg){
            			alert(msg.msg+"OIEEEEE");
            		},
            		error: function(info){
            			alert("Erro ao cadastrar um novo jogador: "+ info.status + " - " + info.statusText);
            		}
            	});
            	
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


/*Função que faz a validação da modal de recuperação de senha*/
validaEsqueci = function() {
    if(validaCampo('#email')){
        return true;
    }
    return false;
}

/*Função que faz a validação do Login*/
validaLogin = function() {
    if(validaCampo('#nome')&&validaCampo('#senha')){
        return true;
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

/*Função que abre as informações dos desenvolvedores */
$(document).ready(function(){

    $("#img_cabral").click(function(){
        $("#div_cabralInfo").toggle(2000);
    });

    $("#img_eduardo").click(function(){
        $("#div_eduardoInfo").toggle(2000);
    });

    $("#img_nones").click(function(){
        $("#div_nonesInfo").toggle(2000);
    });

});