module Aws
  module Xray
    class DefaultErrorHandler
      # @param [IO] io
      def initialize(io)
        @io = io
      end

      # @param [Exception] error
      # @param [String] payload
      # @param [String,nil] host
      # @param [Integer,nil] port
      def call(error, payload, host:, port:)
        @io.puts(<<-EOS)
Failed to send a segment to #{host}:#{port}:
Segnemt:
#{payload}
Error: #{error}
#{error.backtrace.join("\n")}
        EOS
      end
    end
  end
end
