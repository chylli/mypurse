require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the AccountsHelper. For example:
#
# describe AccountsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AccountsHelper, :type => :helper do
  it "format action string with blank" do
    expect(helper.format_action(nil)).to eq("")
  end

  it "format action string with edit" do
    expect(helper.format_action("edit")).to eq("edit_")
  end

  it "format_sti without action & account" do
    expect(helper.format_sti(nil,"SystemAccount", nil)).to eq("system_accounts")
  end

  it "format_sti with action and no account" do
    expect(helper.format_sti("new","SystemAccount",nil)).to eq("new_system_account")
  end

  it "format_sti with action and account" do
    account = instance_double("Account", id: 1)
    expect(helper.format_sti("new","SystemAccount",account)).to eq("new_system_account")
  end

  it "get sti_account_path" do
    account = create(:account)
    expect(helper.sti_account_path("SystemAccount", account, "edit")).to eq("/system_accounts/#{account.id}/edit")
  end

end
