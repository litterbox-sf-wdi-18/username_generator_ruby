# THIS FILE PERFORMS RSPEC TESTS ON `username.rb`
# TO RUN YOUR TESTS TYPE: `rspec username_spec.rb`

require "./username.rb"

describe "#generate_username1" do
  it "returns the first letter of first_name" do
    expect( generate_username1("nathan") ).to eq "nathan"
    expect( generate_username1("nathan") ).to eq "n"
    expect( generate_username1("Nathan") ).to eq "n"
  end
end

describe "#generate_username2" do
  it "combines the first character of the first name and the last name" do
    expect( generate_username2("nathan", "allen") ).to eq "nallen"
    expect( generate_username2("Nathan", "Allen") ).to eq "nallen"
    expect( generate_username2("nathan" , " allen ") ).to eq "nallen"
    expect( generate_username2("nathan", "") ).to eq nil
    expect( generate_username2("", "") ).to eq nil
    expect( generate_username2("Nathan", "Allen !") ).to eq "nallen"
    expect( generate_username2("Nathan", "Allen !") ).to eq "nallen"
    expect( generate_username2("N@th@n    ", "A-l-l-e-n123! ") ).to eq "nallen"
  end
end
   
describe "#generate_username3" do
  it "adds the last two digits of the birth year to the username" do
    expect( generate_username3("john", "doe", 1945) ).to eq "jdoe45"
    expect( generate_username3("john", "doe", 45) ).to eq nil
    expect( generate_username3("john", "doe", 123) ).to eq nil
    expect( generate_username3("john", "doe", 20111) ).to eq nil
    expect( generate_username3("john", "doe", 2000) ).to eq "jdoe00"
    expect( generate_username3("john", "doe", 2001) ).to eq "jdoe01"
  end
end

describe "#check_privilege" do
  let (:user_types) { ["user", "seller", "manager", "admin"] }
  
  it "returns the corresponding privilege prefix" do  

    user_types.each do |utype,i|
      expect( check_privilege(i) ).to eq utype
    end

    expect( check_privilege ).to eq user_types[0]

  end
end

describe "#generate_username4" do
  it "prefixes the username with a user type based on privilege level" do
    expect( generate_username4("john", "doe", 1945, 1) ).to eq "seller-jdoe45"
    expect( generate_username4("john", "doe", 1945, 2) ).to eq "manager-jdoe45"
    expect( generate_username4("john", "doe", 1945, 3) ).to eq "admin-jdoe45"
    expect( generate_username4("john", "doe", 1945, 0) ).to eq "jdoe45"
    expect( generate_username4("john", "doe", 1945) ).to eq "jdoe45"
  end
end
   

describe "#generate_username5" do
  it "ensures the uniquness of usernames" do
    expect( generate_username5("john", "doe", 1945) ).to eq "jdoe45"
    expect( generate_username5("john", "doe", 1945) ).to eq "jdoe45_1"
    expect( generate_username5("john", "doe", 1945) ).to eq "jdoe45_2"
    expect( generate_username5("john", "doe", 1945) ).to eq "jdoe45_3"
  end
end