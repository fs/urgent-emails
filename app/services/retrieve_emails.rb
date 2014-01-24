class RetrieveEmails
  FILE = File.join(app_config.root, 'lib/emails.text')
  EMAIL_REG=/\A[^@]+@[^@]+\z/

  def emails
    Enumerator.new(&method(:read_emails))
  end

  private

  def read_emails(block)
    File.open(FILE) do |file|
      while email = file.gets
        block << email.chomp if valid?(email.chomp)
      end
    end
  end

  def valid?(email)
    EMAIL_REG =~ email
  end
end
