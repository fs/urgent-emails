class RetrieveEmails
  FILE = File.join(app_config.root, 'lib/emails.text')
  EMAIL_REG=/\A[^@]+@[^@]+\z/

  def emails
    Enumerator.new(&method(:read_emails))
  end

  private

  def read_emails(block)
    decrypt_emails

    File.open(FILE) do |file|
      while email = file.gets
        add_valid_email(email.chomp, block)
      end
    end
  end

  def add_valid_email(email, block)
    block << email if email =~ EMAIL_REG
  end

  def decrypt_emails
    `bin/encrypt --decrypt -f #{FILE} -k #{ENV['APP_KEY_SECRET']}`
  end
end
