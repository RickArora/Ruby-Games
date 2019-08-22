def return_number(a)
  ((a / 2)**2) * (65 - (a / 2))
end

# rewritten to

def child_retirement_calculator(age)
  age_till_retirement(age) * estimate_current_bank_balance(age)
end

def age_till_retirement(age)
  65 - (age / 2)
end

def estimate_current_bank_balance(age)
  ((age / 2)**2)
end

print(child_retirement_calculator(30))