class QualificacoesMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def email_nova_qualificacao qualificacao
    @qualificacao = qualificacao
    mail(to: "to@example.com", subject: "Nova Qualificacao")
  end
end
