const std = @import("std");
const vec3 = @import("vector.zig");

pub fn main() !void {
    const image_width = 256;
    const image_height = 256;
    const max_color = 255;

    const stdout = std.io.getStdOut();
    defer stdout.close();

    _ = try stdout.writeAll("P3\n");
    var writer = stdout.writer();
    try std.fmt.format(writer, "{} {}\n{}\n", .{ image_width, image_height, max_color });

    var j: i32 = 0;
    while (j < image_height) {
        {
            var i: i32 = 0;
            while (i < image_width) {
                const red = @intToFloat(f64, i) / (image_width - 1);
                const green = @intToFloat(f64, j) / (image_height - 1);
                const blue = 0.25;
                try std.fmt.format(writer, "{} {} {}\n", .{ @floatToInt(i32, red * 255), @floatToInt(i32, green * 255), @floatToInt(i32, blue * 255) });
                i += 1;
            }
        }
        j += 1;
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
