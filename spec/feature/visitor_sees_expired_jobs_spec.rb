require 'rails_helper'

feature 'Visitor dont see expired jobs' do

  before do
    @job_expired = create(:job, created_at: "Dec 2 2010", title: "banana_job")
    @job_recent = create(:job, created_at: Time.now, title: "potato_job")
  end

  scenario 'successfully' do
    visit root_path

    expect(page).not_to have_content @job_expired.title
  end

  scenario 'message on expired job path' do
    visit job_path(@job_expired)

    expect(page).to have_content "Vaga Expirada"
  end
  scenario 'dont have message on recent jobs' do
    visit job_path(@job_recent)

    expect(page).not_to have_content "Vaga Expirada"
  end
end
