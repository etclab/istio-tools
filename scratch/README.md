- Meshconfig to enable envoy access logs with TLS handshake details
```yaml
  meshConfig:
    accessLogFile: /dev/stdout
    accessLogFormat: |
        start_time=[%START_TIME%] method="%REQ(:METHOD)%" path="%REQ(X-ENVOY-ORIGINAL-PATH?:PATH)%" protocol=%PROTOCOL% response_code=%RESPONSE_CODE% response_flags=%RESPONSE_FLAGS% response_code_details=%RESPONSE_CODE_DETAILS% connection_termination_details=%CONNECTION_TERMINATION_DETAILS% upstream_transport_failure_reason="%UPSTREAM_TRANSPORT_FAILURE_REASON%" bytes_received=%BYTES_RECEIVED% bytes_sent=%BYTES_SENT% duration_ms=%DURATION% upstream_service_time_ms=%RESP(X-ENVOY-UPSTREAM-SERVICE-TIME)% x_forwarded_for="%REQ(X-FORWARDED-FOR)%" user_agent="%REQ(USER-AGENT)%" request_id="%REQ(X-REQUEST-ID)%" authority="%REQ(:AUTHORITY)%" upstream_host="%UPSTREAM_HOST%" upstream_cluster=%UPSTREAM_CLUSTER_RAW% upstream_local_address=%UPSTREAM_LOCAL_ADDRESS% downstream_local_address=%DOWNSTREAM_LOCAL_ADDRESS% downstream_remote_address=%DOWNSTREAM_REMOTE_ADDRESS% requested_server_name=%REQUESTED_SERVER_NAME% route_name=%ROUTE_NAME%

        downstream_tls_session_id="%DOWNSTREAM_TLS_SESSION_ID%" downstream_tls_cipher="%DOWNSTREAM_TLS_CIPHER%" downstream_peer_uri_san="%DOWNSTREAM_PEER_URI_SAN%" downstream_tls_version="%DOWNSTREAM_TLS_VERSION%" downstream_peer_fingerprint_256="%DOWNSTREAM_PEER_FINGERPRINT_256%" downstream_peer_serial="%DOWNSTREAM_PEER_SERIAL%"
        
        upstream_peer_subject="%UPSTREAM_PEER_SUBJECT%" upstream_peer_issuer="%UPSTREAM_PEER_ISSUER%" upstream_tls_session_id="%UPSTREAM_TLS_SESSION_ID%" upstream_tls_cipher="%UPSTREAM_TLS_CIPHER%" upstream_tls_version="%UPSTREAM_TLS_VERSION%" upstream_peer_cert="%UPSTREAM_PEER_CERT%" upstream_peer_uri_san="%UPSTREAM_PEER_URI_SAN%"
```