package k8sallowedrepos

test_image_safety_positive {
    count(violation) == 1 with input.parameters.repos as ["hooli.com/"]
        with input.review.object.spec.containers as [
            {"name": "ok", "image": "hooli.com/web"},
            {"name": "bad", "image": "badrepo.com/web"},
        ]
}

test_image_safety_negative {
    count(violation) == 0 with input.parameters.repos as ["hooli.com/"]
        with input.review.object.spec.containers as [
            {"name": "ok", "image": "hooli.com/web"},
        ]
}

test_image_safety_init_container_positive {
    count(violation) == 1 with input.parameters.repos as ["hooli.com/"]
        with input.review.object.spec.initContainers as [
            {"name": "ok", "image": "hooli.com/web"},
            {"name": "bad", "image": "badrepo.com/web"},
        ]
}

test_image_safety_init_container_negative {
    count(violation) == 0 with input.parameters.repos as ["hooli.com/"]
        with input.review.object.spec.initContainers as [
            {"name": "ok", "image": "hooli.com/web"},
        ]
}
