def make_formatter(stub, value_map, none_replacement="None"):
    def formatter(value):
        if value is None:
            return stub.format(none_replacement)
        else:
            return stub.format(value_map.get(value, "unknown state"))

Formater = namedtuple("Formater", ["stub", "map_function", "default"])


def identity(the_thing):
    return the_thing


formatter_map = {
    "status": Formatter(
        "Coupon Status: {}",
        constants.COUPON_STATUS_NAMES),
