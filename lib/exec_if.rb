require "exec_if/version"

class Object
  def exec_if(obj, &blk)
    case obj
    when Proc
      obj.call(self) ? blk.call(self, obj) : self
    when Symbol
      public_send(obj) ? blk.call(self, obj) : self
    when String
      eval(obj) ? blk.call(self, obj) : self
    when Object
      obj ? blk.call(self, obj) : self
    when nil, false
      self
    end
  end
end
