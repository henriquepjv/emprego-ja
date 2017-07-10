require "rails_helper"

RSpec.describe Job, :type => :model do
  it 'should be valid' do
    job = Job.create()
    expect(job).not_to be_valid
    expect(job.errors[:title]).to include("can't be blank")
    expect(job.errors[:location]).to include("can't be blank")
    expect(job.errors[:description]).to include("can't be blank")
    expect(job.errors[:category]).to include("can't be blank")
  end

  describe "#expired?" do
    context "created 91 days ago" do
      before do
        @job_expired = create(:job, created_at: "Dec 2 2010")
      end
      it "is expired" do
        expect(@job_expired).to be_expired
      end
    end

    context "created 1 day ago" do
      before do
        @job_recent = create(:job, created_at: Time.now)
      end
      it "is valid" do
        expect(@job_recent).to_not be_expired
      end
    end
  end
end
