class DeliverEmails
  def perform(retriever:, mailer:)
    retriever.emails.each do |email|
      mailer.urgent(email).deliver
    end
  end
end
