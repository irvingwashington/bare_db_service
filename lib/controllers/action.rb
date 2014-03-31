module BareDBService
  class Action
    # XXX Lotus misdesign workaround
    def self.call(*args)
      new.call(*args)
    end

  end
end