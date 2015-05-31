require 'rails_helper'

feature 'roasts' do
	
	context 'no roasts have been added' do
		scenario 'should display a prompt to add a roast' do
			visit '/roasts'
			expect(page).to have_content 'No roasts yet!'
			expect(page).to have_link 'Add a roast'
		end
	end

	context 'roasts have been added' do
		before do
			Roast.create(name: 'Roast Chicken')
		end

		scenario 'display roasts' do
			visit '/roasts'
			expect(page).to have_content('Roast Chicken')
			expect(page).not_to have_content('No roasts yet!')
		end
	end

	context 'creating roasts' do
		scenario 'prompts user to fill out a form, then displays the new roast' do
			visit '/roasts'
			click_link 'Add a roast'
			fill_in 'Name', with: 'Roast Chicken'
			click_button 'Add Roast'
			expect(page).to have_content 'Roast Chicken'
			expect(current_path).to eq '/roasts'
		end
	end

	context 'viewing roasts' do
		let!(:beef){Roast.create(name: 'Roast Beef')}

		scenario 'lets a user view a roast' do
			visit '/roasts'
			click_link 'Roast Beef'
			expect(page).to have_content 'Roast Beef'
			expect(current_path).to eq "/roasts/#{beef.id}"
		end
	end

end