Dado "o portfólio possui um bloco de Sobre" do
	create(:block, kind: :about, side: :left, portfolio_id: @portfolio.id)
end

Dado "o portfólio possui 1 Sobre" do
	create(:block, kind: :about, side: :left, portfolio_id: @portfolio.id)
	@about = create(:about, portfolio_id: @portfolio.id)
end

Quando "adiciona um Sobre" do
	@about = attributes_for(:about)
	fill_in "about-description", with: @about[:description]
	find("#about-description").send_keys(:tab)
	wait_for_ajax
end

Quando "remove o Sobre" do
	find(".remove-description").click
	wait_for_ajax
end

Então "o Sobre é adicionado ao Portfólio" do
	@portfolio.reload
	expect(@portfolio.abouts.count).to eq 1
	expect(page).to have_css(".resource-about", count: 1)
end

Então "o Sobre é removido do Portfólio" do
	@portfolio.reload
	expect(@portfolio.abouts.count).to eq 0
	expect(page).to_not have_css(".resource-about", count: 1)
end