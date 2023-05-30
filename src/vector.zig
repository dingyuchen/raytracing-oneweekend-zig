const std = @import("std");

pub fn vec(comptime T: type) type {
    return struct {
        x: T,
        y: T,
        z: T,
    };
}
