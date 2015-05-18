class RetrieveEmails
  EMAIL_REG = /\A[^@]+@[^@]+\z/

  def emails
    Enumerator.new(&method(:read_emails))
  end

  private

  def read_emails(block)
    (ENV['EMAILS'] || '').split(',').each do |email|
      add_valid_email(email.chomp, block)
    end
  end

  def add_valid_email(email, block)
    block << email if email =~ EMAIL_REG
  end
end
