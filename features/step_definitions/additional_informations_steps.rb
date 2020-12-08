Dado "o portfólio possui um bloco de Informação Adicional" do
	create(:block, kind: :additional_information, side: :left, portfolio_id: @portfolio.id)
end

Dado "o portfólio possui 1 Informação Adicional" do
	block = create(:block, kind: :additional_information, side: :left, portfolio_id: @portfolio.id)
	@additional_information = create(:additional_information, portfolio_id: @portfolio.id, block_id: block.id)
end

Quando "adiciona uma Informação Adicional" do
	@additional_information = attributes_for(:additional_information)
	fill_in "additional-information-title", with: @additional_information[:title]
	find("#additional-information-title").send_keys(:tab)
	fill_in "additional-information-description", with: @additional_information[:description]
	find("#additional-information-description").send_keys(:tab)
	wait_for_ajax
end

Quando "remove a Informação Adicional" do
	find(".remove-additional_information").click
	wait_for_ajax
end

Então "a Informação Adicional é adicionada ao Portfólio" do
	@portfolio.reload
	expect(@portfolio.additional_information.count).to eq 1
	expect(page).to have_css(".resource-additional_information", count: 1)
end

Então "a Informação Adicional é removida do Portfólio" do
	@portfolio.reload
	expect(@portfolio.additional_information.count).to eq 0
	expect(page).to_not have_css(".resource-additional_information", count: 1)
end