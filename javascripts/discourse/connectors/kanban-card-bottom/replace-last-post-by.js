import formatDate from "discourse/helpers/format-date";

export default {
  setupComponent(_, component) {
    const topic = component.args.topic;

    document.querySelectorAll(".last-post-by").forEach((el) => {
      const formattedTime = formatDate(topic.created_at, {
        format: "tiny",
        noTitle: true,
      });
      el.innerHTML = `${formattedTime} (${topic.creator.username})`;
    });
  },
};
