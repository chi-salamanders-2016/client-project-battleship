require "rails_helper"

feature "register a user" do
  context "Valid fields" do
    scenario "the user inputs valid fields into the form and an account is created" do
      
      visit '/users/new'

      within('#new_user') do
      	fill_in 'Username', :with => "user"
      	fill_in 'Email', :with =>  "user@example.com"
      	fill_in 'Password', :with => "password1234"
      end
      expect{click_button 'Register'}.to change{User.count}.by(1)
    end
  end

  context "Invalid fileds" do
  	scenario "The user inputs invalid fields into the form and an account is not created" do
  		visit '/users/new'

      within('#new_user') do
      	fill_in 'Username', :with => ""
      	fill_in 'Email', :with =>  ""
      	fill_in 'Password', :with => ""
      end
      expect{click_button 'Register'}.to change{User.count}.by(0)
    end

    scenario "the password is too short and an account is not created" do
    	visit '/users/new'

      within('#new_user') do
      	fill_in 'Username', :with => "User"
      	fill_in 'Email', :with =>  "User@example.com"
      	fill_in 'Password', :with => "pass"
      end
      expect{click_button 'Register'}.to change{User.count}.by(0)
    end
  end


  feature 'Login a user' do
  	context 'The user is in the database' do
  		scenario 'The user inputs valid fields and is logged into the site' do
  			visit '/users/new'

     		within('#new_user') do
      		fill_in 'Username', :with => "user"
      		fill_in 'Email', :with =>  "user@example.com"
      		fill_in 'Password', :with => "password1234"
      	end
      	expect{click_button 'Register'}.to change{User.count}.by(1)

      	visit '/sessions/new'

	      fill_in 'Email', :with =>  "user@example.com"
	      fill_in 'Password', :with => "password1234"
	      click_button 'Sign In'
	      expect(page).to have_content "user"
    	end
  	end
  end

  feature 'Login a user' do
  	context 'The user is not in the database' do
  		scenario 'The user inputs invalid fields and the form is re-rendered' do
      	visit '/sessions/new'

	      fill_in 'Email', :with =>  "user@example.com"
	      fill_in 'Password', :with => "password1234"
	      click_button 'Sign In'
	      expect(page).to have_content "email or password is incorrect"
    	end
  	end
  end

  feature 'User page stats' do
    context 'User page properly displays stats' do
      scenario 'The user can see how many games they have won' do
        user2 = User.create(username: "User2", email: "User2@gmail.com", password: "password1234")
        visit user_path(user2)
        expect(page).to have_content user2.games_won
      end

      scenario 'The user can see their win lose ratio' do
        user2 = User.create(username: "User2", email: "User2@gmail.com", password: "password1234")
        visit user_path(user2)
        expect(page).to have_content user2.win_loss_ratio
      end

      scenario 'User page displays total shots of the user' do
        user2 = User.create(username: "User2", email: "User2@gmail.com", password: "password1234")
        visit user_path(user2)
        expect(page).to have_content user2.total_shots_fired
      end

      scenario 'User page displays accuracy of the user' do
        user2 = User.create(username: "User2", email: "User2@gmail.com", password: "password1234")
        visit user_path(user2)
        expect(page).to have_content user2.calculate_accuracy
      end
    end
  end
end
