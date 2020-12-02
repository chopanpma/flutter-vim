# Django Shortcuts
alias makemigrations='docker-compose -f local.yml run --rm --service-ports django python manage.py makemigrations'
alias migrate='docker-compose -f local.yml run --rm --service-ports django python manage.py migrate'
alias manage='docker-compose -f local.yml run --rm --service-ports django python manage.py'
alias build-django='docker-compose -f local.yml build'
alias build-django-production='docker-compose -f production.yml build'
alias createsuperuser='docker-compose -f local.yml run --rm --service-ports django python manage.py createsuperuser'

# Tests
alias testpca-u='docker-compose -f local.yml run --rm --service-ports django python manage.py test payment_collector.api.tests.unit'
alias mp-test='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.tests'
alias mp-test-api='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.test_api'
alias mp-test-utils='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.test_utils'
alias mp-test-full='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit'
alias mp-test-integration='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.integration'
alias mp-test-interbank-records='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.test_interbank_records'
alias mp-test-commands='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.test_commands'
alias mp-test-pca='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.test_utils.PaymentCollectorTestCase'
alias test-soap='mvn -Dtest=SoapInterbankApplicationTests test'
alias im-test='docker-compose -f local.yml run --rm --service-ports django python manage.py test --settings=test_settings integrator_models.tests.unit'
alias il-test-full='docker-compose -f local.yml run --rm --service-ports django python manage.py test integrator_legacy.mpconnector.tests.unit'
alias mp-test-aws='docker-compose -f local.yml run --rm --service-ports django python manage.py test multipagos_integrator.mpconnector.tests.unit.test_aws_utils'
alias pp-test-full='docker-compose -f local.yml run --rm --service-ports django python manage.py test puntopago_integration.rest.tests.unit.test_api'
alias tw-test-full='docker-compose -f local.yml run --rm --service-ports django python manage.py test twilio_integration.rest.tests.unit.test_api'
alias apc-test-read-whitelist-file='docker-compose -f local.yml run --rm --service-ports django python manage.py test apc_adelantos.apc.tests.test_read_whitelist_unfiltered'
alias lms-test-queries='docker-compose -f local.yml run --rm --service-ports django python manage.py test lms_graphql_backend.backend.tests.unit.test_queries'
alias lms-test-schema='docker-compose -f local.yml run --rm --service-ports django python manage.py test lms_graphql_backend.backend.tests.unit.test_schema'
alias lms-test-all='docker-compose -f local.yml run --rm --service-ports django python manage.py test lms_graphql_backend.backend.tests.unit'
alias mobile-inquiries-test-all='docker-compose -f local.yml run --rm --service-ports django python manage.py test mobile_inquiries.mobile.tests.unit'
alias mobile-inquiries-test-api='docker-compose -f local.yml run --rm --service-ports django python manage.py test mobile_inquiries.mobile.tests.unit.test_api'
alias web-scrapers-unit='docker-compose -f local.yml run --rm --service-ports django python manage.py test adelantos_web_scrapers.web_scrapers.tests.unit.tests'
alias knox-control-test-api='docker-compose -f local.yml run --rm --service-ports django python manage.py test knox_control.control.tests.unit.test_api_payg'
alias knox-control-test-api-all='docker-compose -f local.yml run --rm --service-ports django python manage.py test knox_control.control.tests.unit.test_api.KnoxSamsungStatusViewTestCase.test_get_status_fail_sim_not_found'
alias knox-control-test-token='docker-compose -f local.yml run --rm --service-ports django python manage.py test knox_control.control.tests.unit.test_api.MockGraphQLTestCase'
alias test-clave='docker-compose -f local.yml run --rm --service-ports django python manage.py test clave_adelantos.rest.tests'
alias testcupos-u='docker-compose -f local.yml run --rm --service-ports django python manage.py test adelantos_cupos.cupos.tests.unit'

# Docker shortcuts
alias docker-build-run='docker-compose -f local.yml build && docker-compose  -f local.yml up'
alias docker-build-run-debug='docker-compose -f local.yml build && docker-compose  -f local.yml run --rm --service-ports django'
alias docker-build='docker-compose -f local.yml build'
alias docker-build-no-cache='docker-compose -f local.yml build --no-cache'
alias docker-run='docker-compose -f local.yml up'
alias docker-kill-all='docker container kill $(docker ps -q)'
alias docker-prune='docker system prune'
alias exec-bash-sql1='docker exec -it sql1 bash'
alias sql1='docker start sql1'

alias mod-vim='vim ~/.vimrc'
alias mod-zsh='vim ~/.zshrc; source ~/.zshrc'
source-aliases () {
    source ~/.bash_aliases
    echo ".bash_aliases sourced."
}

mod-aliases () {
    vim ~/.bash_aliases
    source ~/.bash_aliases
}

alias cupos-load-data='manage loaddata cupos_config transaction_detail_type transaction_type'
alias testrayopago-u='docker-compose -f local.yml run --rm --service-ports django python manage.py test mock_adelantos.rest.tests.unit'
