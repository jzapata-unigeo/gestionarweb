$('#form-clave').validate({
    rules: {
        clave3: {
            required: true,
            equalTo: '#clave2'
        }
    },
    messages: {
        clave3: {
            required: "Complete este campo",
            equalTo: "Debe coincidir con la nueva clave"
        }
    }
});

$('#aceptar').on('click',function(e) {
    
    e.preventDefault();
    
    if($('#form-clave').valid()==true)
        alert('el formulario es válido!');
    
});