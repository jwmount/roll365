rails generate scaffold Company name credit_terms:integer PO_required:boolean active:boolean bookkeeping_number:integer line_of_business url licensee
rails generate scaffold Person company_id:integer first_name last_name title available:boolean available_on:datetime OK_to_contact:boolean active:boolean
rails generate scaffold Job solution_id:integer start_on:datetime time name finished_on:datetime purchase_order active:boolean complete:boolean
rails generate scaffold equipment name:string{60} company_id:integer
