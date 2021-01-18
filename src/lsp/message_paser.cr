module LSP
  module MessageParser
    extend self

    def self.read_headers(io)
      headers = [] of Tuple(String, String)

      loop do
        header = read_header(io)
        break if header.nil?
        headers << header
      end

      headers
    end

    def self.read_header(io)
      io.gets.try do |raw|
        parts =
          raw.split(':')

        {parts[0].strip, parts[1].strip} if parts.size == 2
      end
    end

    def self.parse(io)
      headers =
        read_headers(io)

      content_length =
        headers
          .find(&.first.==("Content-Length"))
          .try(&.last)

      if content_length
        content =
          io.read_string(content_length.to_i)

        JSON.parse(content)
      end
    end

    def self.parse(io)
      headers =
        read_headers(io)

      content_length =
        headers
          .find(&.first.==("Content-Length"))
          .try(&.last)

      if content_length
        content =
          io.read_string(content_length.to_i)

        json =
          JSON.parse(content)

        method =
          json["method"]?

        id =
          json["id"]?

        result =
          json["result"]?

        error =
          json["error"]?

        if id && (error || result)
          # TODO: Handle response to request
        elsif method
          yield method.as_s, content
        end
      end
    end
  end
end
