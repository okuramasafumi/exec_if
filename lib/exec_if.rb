require "exec_if/version"

class Object
  def exec_if(obj, &blk)
    if obj
      blk.call(self, obj)
    else
      self
    end
  end
end
