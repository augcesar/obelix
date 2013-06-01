# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
#
# These inflection rules are supported but not enabled by default:
 ActiveSupport::Inflector.inflections do |inflect|
   #inflect.acronym 'RESTful'
   inflect.irregular 'login','login'
   inflect.irregular 'sip','sip'
   inflect.irregular 'iax','iax'
   inflect.irregular 'ramal','ramais'	
   inflect.irregular 'caixa_postal','caixas_postais'
   inflect.irregular 'plano_discagem','planos_discagens'
   inflect.irregular 'monitoramento','monitoramentos'

 end
