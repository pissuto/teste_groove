require 'capybara'
require 'cucumber'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'json'
require 'rspec'
require 'report_builder'

ENVIRONMENT = ENV['ENVIRONMENT']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT}.yml")

ReportBuilder.configure do |config|
  config.json_path = "results/report.json" #pasta onde salva o json
  config.report_path = "results/report" #pasta onde salva o html
  config.report_types = [:html] #tipo de report a exportar
  config.report_title = "Report de testes" #nome do report
  config.color = "blue" #cor do report
  config.include_images = true #se coloca imagens ou não
  config.additional_info = { user: CONFIG['User']} 
end
#essa variável ambiente recebe uma configuração do ENV. voce pode apagar os IFs ali e deixar o nome chumbado
at_exit do
  ReportBuilder.build_report
end

Capybara.configure do |config|
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 15
end
