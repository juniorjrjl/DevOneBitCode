Dado "possui {int} portifólio(s) cadastrado(s)" do |count|
    create_list(:portfolio, count, user_id: @use.id)
end

Quando "acessa a lista  de portifólios" do
    visit portfolios_path
end

Então "os {int} portifólios são listados" do |count|
    expect(page).to have_css(".portfolio", count: count)
end

Então "nenhum portifólio é listado" do
    expect(page).to have_css(".portfolio", count: count)
end

Então "volta para a página de login" do
    expect(page).to have_current_path("/users/sign_in")
end