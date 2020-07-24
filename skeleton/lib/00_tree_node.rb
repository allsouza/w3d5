require "byebug"
class PolyTreeNode
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    attr_accessor :value , :parent , :children 

    def inspect
        parent_value = @parent ? @parent.value : "no parent"
        { 'value' => @value, 'parent_value' => parent_value, 'children' => @children }.inspect
    end

    def parent=(grand_parent)
        # return if 
        if grand_parent != nil && @parent != grand_parent
            old_parent = @parent
            if !(grand_parent.children).include?(self) 
                @parent = grand_parent
                grand_parent.add_child(self)  #returns parent inf loop l15 - 20
               #
                grand_parent.children << self 
                
            end  
            (old_parent.children).delete(self) if old_parent != nil
        end        
         @parent = nil if grand_parent == nil
    end

    def add_child(node) 
       node.parent = self
    end
  #  should pass nil to the child's #parent= (FAILED - 4)
 # should raise an error if node is not a child (FAILED - 3)  
    def remove_child(node)
        if node.parent == nil
            raise "this is an orphan"
        end  
        node.parent = nil
    end
    


    
end

# old_parent = @parent
# @parent = grand_parent 
# #   debugger
# grand_parent.add_child(self)
# if  old_parent != nil 
#    old_parent.remove_child(self)
# end


