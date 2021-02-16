resource "aws_api_gateway_resource" "confirmation_resource" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "confirmation-service"
}

resource "aws_api_gateway_resource" "confirmation_resource_proxy" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_resource.confirmation_resource.id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "confirmation_method" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.confirmation_resource_proxy.id
  http_method   = "ANY"
  authorization = "NONE"
  request_parameters = {
    "method.request.path.proxy" = true
  }
}

resource "aws_api_gateway_integration" "confirmation_integration" {
  rest_api_id = "${aws_api_gateway_rest_api.main.id}"
  resource_id = "${aws_api_gateway_resource.confirmation_resource_proxy.id}"
  http_method = "${aws_api_gateway_method.confirmation_method.http_method}"
  integration_http_method = "ANY"
  type                    = "HTTP_PROXY"
  uri                     = "https://virtserver.swaggerhub.com/akashchandwani7/obs-confirmation-funds/v3.1.6/{proxy}"
 
  request_parameters =  {
    "integration.request.path.proxy" = "method.request.path.proxy"
  }
}