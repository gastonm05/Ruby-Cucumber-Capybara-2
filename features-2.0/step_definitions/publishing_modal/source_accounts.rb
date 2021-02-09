class SourceAccounts < BasePage
  def get_account(accounts_alias)
    accounts_alias.map! { |account_alias| input_elements[account_alias.to_sym] }
  end
end
