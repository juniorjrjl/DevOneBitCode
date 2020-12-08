Dado "o portfólio possui um bloco de Rede Social" do
	create(:block, kind: :social, side: :left, portfolio_id: @portfolio.id)
end

Dado "o portfólio possui 1 Rede Social" do
	create(:block, kind: :social, side: :left, portfolio_id: @portfolio.id)
	@social = create(:social, portfolio_id: @portfolio.id)
end

Quando "adiciona uma Rede Social" do
	@social = attributes_for(:social)
	find(:xpath, "//select[@id='select-social-kind']").click
	find(:xpath, "//select[@id='select-social-kind']/option[@value='#{@social[:kind]}']").select_option
	fill_in "social-url", with: @social[:url]
	find("#add-social").click
	wait_for_ajax
end

Quando "remove a Rede Social" do
	find(".remove-social").click
	wait_for_ajax
end

Então "a Rede Social é adicionada ao Portfólio" do
	@portfolio.reload
	expect(@portfolio.socials.count).to eq 1
	expect(page).to have_css(".resource-social", count: 1)
end

Então "a Rede Social é removida do Portfólio" do
	@portfolio.reload
	expect(@portfolio.socials.count).to eq 0
	expect(page).to_not have_css(".resource-social", count: 1)
end