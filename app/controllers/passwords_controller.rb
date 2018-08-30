conditions[:email].downcase! if conditions[:email]
where(conditions.to_hash).first
