json.extract! bank_account, :id, :account_number, :account_holder_name, :code_type, :code, :branch_name, :resource_id, :created_at, :updated_at
json.url bank_account_url(bank_account, format: :json)
