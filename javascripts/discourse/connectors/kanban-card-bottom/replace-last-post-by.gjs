import Component from "@glimmer/component";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import didUpdate from "@ember/render-modifiers/modifiers/did-update";
import formatDate from "discourse/helpers/format-date";

export default class ReplaceLastPostBy extends Component {
  get topicCreatedAt() {
    return this.args.topic.created_at;
  }

  get topicCreator() {
    return this.args.topic.creator.name;
  }

  @action
  modifyElement(element) {
    const topicCard = element.closest(".topic-card");

    if (topicCard) {
      const lastPostByEl = topicCard.querySelector(".last-post-by");

      if (lastPostByEl) {
        const formattedTime = formatDate(this.topicCreatedAt, {
          format: "tiny",
          noTitle: true,
        });
        lastPostByEl.innerHTML = `${formattedTime} (${this.topicCreator})`;
      }
    }
  }

  <template>
    <div
      {{didInsert this.modifyElement}}
      {{didUpdate this.modifyElement @topic}}
    >
    </div>
  </template>
}
