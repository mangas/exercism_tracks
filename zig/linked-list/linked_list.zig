pub fn LinkedList(comptime T: type) type {
    return struct {

        // Please implement the doubly linked `Node` (replacing each `void`).
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        const Self = @This();

        // Please implement the fields of the linked list (replacing each `void`).
        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,

        pub fn push(self: *Self, node: *Node) void {
            const tail = self.last;
            self.len += 1;
            self.last = node;

            if (tail) |t| {
                t.next = node;
            } else {
                self.first = node;
            }
            node.prev = tail;
            node.next = null;
        }

        pub fn pop(self: *Self) ?*Node {
            const tail = self.last orelse return null;

            delete(self, tail);

            return tail;
        }

        pub fn shift(self: *Self) ?*Node {
            const head = self.first orelse return null;
            delete(self, head);

            return head;
        }

        pub fn unshift(self: *Self, node: *Node) void {
            const head = self.first;
            self.len += 1;
            self.first = node;
            if (head) |h| {
                node.next = head;
                h.prev = node;
            } else {
                // No head means empty list
                self.last = node;
            }
        }

        pub fn delete(self: *Self, node: *Node) void {
            if (self.len == 0) return;

            var n = self.first;
            while (n) |node2| {
                if (node == node2) break;
                n = node2.next;
            }
            if (n == null) return;

            if (self.len == 1) {
                self.last = null;
                self.first = null;
                self.len = 0;
                return;
            }

            self.len -= 1;

            if (node.prev) |prev| {
                prev.next = node.next;
            } else if (self.first) |first| {
                self.first = first.next;
            }

            if (node.next) |next| {
                next.prev = node.prev;
            } else if (self.last) |last| {
                self.last = last.prev;
            }
        }
    };
}
