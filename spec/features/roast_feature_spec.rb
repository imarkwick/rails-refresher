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

end