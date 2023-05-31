const std = @import("std");

pub fn Vec(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,

        const Self = @This();

        pub fn string(self: Vec(T), alloc: std.mem.Allocator) ![]u8 {
            return std.fmt.allocPrint(alloc, "{} {} {}", .{ self.x, self.y, self.z });
        }

        pub fn len(self: Vec(T)) std.math.Sqrt(T) {
            return std.math.sqrt(self.lenSquare());
        }

        fn lenSquare(self: Self) T {
            return self.x * self.x + self.y * self.y + self.z * self.z;
        }

        pub fn add(self: Vec(T), other: Vec(T)) Vec(T) {
            return Vec(T){
                .x = self.x + other.x,
                .y = self.y + other.y,
                .z = self.z + other.z,
            };
        }
        pub fn scale(self: Vec(T), scalar: T) Vec(T) {
            return Vec(T){
                .x = self.x * scalar,
                .y = self.y * scalar,
                .z = self.z * scalar,
            };
        }
    };
}

test "scale works as intended" {
    const int_vec = Vec(i64){
        .x = 3,
        .y = 4,
        .z = 5,
    };

    const scaled = int_vec.scale(2);
    std.debug.assert(scaled.x == int_vec.x * 2);
    std.debug.assert(scaled.y == int_vec.y * 2);
    std.debug.assert(scaled.z == int_vec.z * 2);
}

test "scale works for doubles vec" {
    const fp_vec = Vec(f64){
        .x = 2,
        .y = 4,
        .z = 5,
    };

    const scaled = fp_vec.scale(2.5);
    std.debug.assert(scaled.x == fp_vec.x * 2.5);
    std.debug.assert(scaled.y == fp_vec.y * 2.5);
    std.debug.assert(scaled.z == fp_vec.z * 2.5);
}
