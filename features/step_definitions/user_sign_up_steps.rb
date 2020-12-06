Dado ("que o usuário informa dados válidos") do
    @user = build(:user)
    fill_sign_in_form
end

Dado ("que o usuário informa email inválido") do
    generate_user_data(email: FFaker::Lorem.unique.word)
    fill_sign_in_form
end

Dado ("que o usuário informa um email já cadastrado no sistema") do
    create_user
    fill_sign_in_form
end

Dado ("que o usuário informa senha e confirmação de senha diferentes") do
    generate_user_data(password: 123456, password_confirmation:654321)
    fill_sign_in_form
end

Dado ("que o usuário informa uma senha muito curta") do
    generate_user_data(password: 12345, password_confirmation: 12345)
    fill_sign_in_form
end

Então ("o usuário é redirencinado para página de novo usuário") do
    expect(page).to have_current_path('/users')
end

Então ("o usuário é redirecionado para index de portfólios") do
    expect(page).to have_current_path('/portfolios')
end

Então ("o usuário permaneça na página atual") do
    expect(page).to have_current_path(root_path)
end

E ("clica no botão Criar Agora") do
    within "div.submit-button" do
        click_on "Criar Agora"
    end
end

E ("deve haver uma mensagem de senhas diferentes") do
    check_has_error_message("Password confirmation doesn't match Password")
end


E ("deve haver uma mensagem de email já cadastrado") do
    check_has_error_message("Email has already been taken")
end

E ("deve haver uma mensagem de senha muito curta") do
    check_has_error_message("Password is too short (minimum is 6 characters)")
end

def check_has_error_message(message)
    section = find(:xpath, '//div[@id="error_explanation"]/ul/li')
    expect(section.text).to eq(message)
end

def generate_user_data(params)
    @user = build(:user, params)  
end

def create_user
    @user = create(:user)
end

def fill_sign_in_form
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    fill_in "user[password_confirmation]", with: @user.password_confirmation
end