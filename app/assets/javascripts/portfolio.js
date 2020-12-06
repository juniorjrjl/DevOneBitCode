document.addEventListener("turbolinks:load", () => {

    var selectedPortfolio = 0;

    $(".remove-portfolio").click((evt) => {
        $('#removePortfolio').modal('open');
        selectedPortfolio = $(evt.currentTarget).data('id');
        evt.preventDefault();
    });

    $("#confirmDelete").click((evt =>{
        $.ajax({
            url: `portfolios/${selectedPortfolio}`,
            type: 'DELETE',
            contentType: 'application/json',
            success: (data, text, jqXHR) => {
                M.toast({html: 'Portfolio excluido com sucess.', classes: 'custom-green'});
                location.reload();
            },
            error: (jqXHR, textStatus, errorThrown) => M.toast({html: 'Erro ao excluir portofólio', classes: 'custom-green'})
        });
    }));

})