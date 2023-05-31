const std = @import("std");

pub fn Vec(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,

        pub fn string(self: Vec(T), alloc: std.mem.Allocator) ![]u8 {
            return std.fmt.allocPrint(alloc, "{} {} {}", .{ self.x, self.y, self.z });
        }
    };
}

test "string printing function" {
    var int_vec = Vec(i32){
        .x = 3,
        .y = 4,
        .z = 5,
    };
    std.debug.print("{s}", .{int_vec.string()});
    // std.debug.assert(int_vec.string() == "3 4 5");
}
