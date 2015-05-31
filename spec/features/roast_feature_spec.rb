require 'rails_helper'

feature 'roasts' do
	
	context 'no roasts have been added' do
		scenario 'should display a prompt to add a roast' do
			visit '/roasts'
			expect(page).to have_content 'No roasts yet!'
			expect(page).to have_link 'Add a roast'
		end
	end

end