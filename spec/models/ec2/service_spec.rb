require 'spec_helper'

RSpec.describe Ec2::Service, type: :model do
  
	subject(:ec2) { Ec2::Service.new }

	it "returns a client" do
		expect(ec2).not_to be_nil
	end


	context 'instance selections' do

		subject(:instances) { ec2.instances("running")}

		it "returns instances" do
			expect(instances).not_to be_nil
		end	

		context "instance tests" do
			subject(:instance) { instances[0] }

			it "returns instance objects" do
				expect(instance).to be_an(Ec2::Instance)
			end	

			it "has an id" do
				expect(instance.id).not_to be_nil
			end	

			it "has a name" do
				expect(instance.name).to be_a(String)
				expect(instance.name.length).to be > 0
			end	

			it "returns raw struct" do
				expect(instance.raw).to be_a(Struct)
			end
		end

	end

end
