resource "aws_api_gateway_deployment" "aplha_deployment" {
  depends_on = [aws_api_gateway_integration.accounts_integration, aws_api_gateway_integration.confirmation_integration, aws_api_gateway_integration.events_integration, aws_api_gateway_integration.notifications_integration, aws_api_gateway_integration.payment_integration]

  rest_api_id = aws_api_gateway_rest_api.main.id
  stage_name  = "alpha"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_deployment" "beta_deployment" {
  depends_on = [aws_api_gateway_integration.accounts_integration, aws_api_gateway_integration.confirmation_integration, aws_api_gateway_integration.events_integration, aws_api_gateway_integration.notifications_integration, aws_api_gateway_integration.payment_integration]

  rest_api_id = aws_api_gateway_rest_api.main.id
  stage_name  = "beta"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_deployment" "prod_deployment" {
  depends_on = [aws_api_gateway_integration.accounts_integration, aws_api_gateway_integration.confirmation_integration, aws_api_gateway_integration.events_integration, aws_api_gateway_integration.notifications_integration, aws_api_gateway_integration.payment_integration]

  rest_api_id = aws_api_gateway_rest_api.main.id
  stage_name  = "prod"

  lifecycle {
    create_before_destroy = true
  }
}