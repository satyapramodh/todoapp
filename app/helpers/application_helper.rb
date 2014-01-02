module ApplicationHelper

def broadcast(channel, &block)

	message = {:channel => channel, :data => capture(&block)}
	uri = URI.parse("http://localhost:9292/faye")
	NET::HTTP.post_form(uri, :message => message.to_json)

end

def link_to_submit(*args, &block)
  link_to_function (block_given? ? capture(&block) : args[0]), "$(this).closest('form').submit()", args.extract_options!
end

end
