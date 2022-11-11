=begin
#CMS Source Code

#Endpoints for interacting with files in the CMS Developer File System. These files include HTML templates, CSS, JS, modules, and other assets which are used to create CMS content.

The version of the OpenAPI document: v3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.2.1

=end

require 'cgi'

module Hubspot
  module Cms
    module SourceCode
      class ValidationApi
        attr_accessor :api_client

        def initialize(api_client = ApiClient.default)
          @api_client = api_client
        end
        # Validate the contents of a file
        # Validates the file contents passed to the endpoint given a specified path and environment. Accepts multipart/form-data content type.
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @option opts [File] :file The file to validate.
        # @return [Error]
        def do_validate(path, opts = {})
          data, _status_code, _headers = do_validate_with_http_info(path, opts)
          data
        end

        # Validate the contents of a file
        # Validates the file contents passed to the endpoint given a specified path and environment. Accepts multipart/form-data content type.
        # @param path [String] The file system location of the file.
        # @param [Hash] opts the optional parameters
        # @option opts [File] :file The file to validate.
        # @return [Array<(Error, Integer, Hash)>] Error data, response status code and response headers
        def do_validate_with_http_info(path, opts = {})
          if @api_client.config.debugging
            @api_client.config.logger.debug 'Calling API: ValidationApi.do_validate ...'
          end
          # verify the required parameter 'path' is set
          if @api_client.config.client_side_validation && path.nil?
            fail ArgumentError, "Missing the required parameter 'path' when calling ValidationApi.do_validate"
          end
          pattern = Regexp.new(/.+/)
          if @api_client.config.client_side_validation && path !~ pattern
            fail ArgumentError, "invalid value for 'path' when calling ValidationApi.do_validate, must conform to the pattern #{pattern}."
          end

          # resource path
          local_var_path = '/cms/v3/source-code/{environment}/validate/{path}'.sub('{' + 'path' + '}', CGI.escape(path.to_s))

          # query parameters
          query_params = opts[:query_params] || {}

          # header parameters
          header_params = opts[:header_params] || {}
          # HTTP header 'Accept' (if needed)
          header_params['Accept'] = @api_client.select_header_accept(['*/*'])
          # HTTP header 'Content-Type'
          content_type = @api_client.select_header_content_type(['multipart/form-data'])
          if !content_type.nil?
              header_params['Content-Type'] = content_type
          end

          # form parameters
          form_params = opts[:form_params] || {}
          form_params['file'] = opts[:'file'] if !opts[:'file'].nil?

          # http body (model)
          post_body = opts[:debug_body]

          # return_type
          return_type = opts[:debug_return_type] || 'Error'

          # auth_names
          auth_names = opts[:debug_auth_names] || ['hapikey', 'oauth2']

          new_options = opts.merge(
            :operation => :"ValidationApi.do_validate",
            :header_params => header_params,
            :query_params => query_params,
            :form_params => form_params,
            :body => post_body,
            :auth_names => auth_names,
            :return_type => return_type
          )

          data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
          if @api_client.config.debugging
            @api_client.config.logger.debug "API called: ValidationApi#do_validate\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
          end
          return data, status_code, headers
        end
      end
    end
  end
end
