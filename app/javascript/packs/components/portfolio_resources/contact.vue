<template>
    <div class="bloco-contato row">
        <form class="contact col s12">
            <div class="col m10 offset-m1 s12 center">
                <input placeholder="Telefone/Celular" id="contact-phone" v-model="contact.phone" @change="submit()" class="font_20 custom-grey-text text-darken-1">
				<label class="active font_20 custom-grey-text text-darken-1">Telefone/Celular</label>
            </div>
            <div class="col m10 offset-m1 s12 center">
                <input placeholder="email" id="contact-email" v-model="contact.email" @change="submit()" class="font_20 custom-grey-text text-darken-1">
				<label class="active font_20 custom-grey-text text-darken-1">Email</label>
            </div>
            <div class="col m10 offset-m1 s12 center">
                <input placeholder="Página Web" id="contact-website" v-model="contact.website" @change="submit()" class="font_20 custom-grey-text text-darken-1">
				<label class="active font_20 custom-grey-text text-darken-1">Página Web</label>
            </div>
            <div class="col m10 offset-m1 s12 center">
                <input placeholder="País" id="contact-address_country" v-model="contact.address_country" @change="submit()" class="font_20 custom-grey-text text-darken-1">
				<label class="active font_20 custom-grey-text text-darken-1">País</label>
            </div>
            <div class="col m10 offset-m1 s12 center">
                <input placeholder="Cidade" id="contact-address_city" v-model="contact.address_city" @change="submit()" class="font_20 custom-grey-text text-darken-1">
				<label class="active font_20 custom-grey-text text-darken-1">Cidade</label>
            </div>
        </form>
    </div>
</template>
 
 
<script>
 
export default {

	props: ['portfolioId'],
 
	data() {
		return {
			contact: { },
		}
    },

    created(){
        this.$resource('/portfolios{/portfolioId}/contacts').get({ portfolioId: this.portfolioId })
        .then(response => this.contact = response.body.resource ,
              response => M.toast({ html: "Ocorreu um erro ao tentar carregar as informações de contato", classes: "red" }))
    },

    methods: {
        submit(){
			let formData;

			this.$http.patch(`/portfolios/${this.portfolioId}/contacts/${this.contact.id}`, {contact: this.contact})
				.then(response =>
					this.profile = response.body.profile
				, response => 
					response.body.errors.forEach(error => { M.toast({ html: error, classes: "red" }) }))
		}
    }
    
}
 
</script>