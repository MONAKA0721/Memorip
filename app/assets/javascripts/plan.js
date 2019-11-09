var memos = new Vue({
  el: "#trip-memos",
  data: {
    named: true,
    anonymous: false
  },
  methods: {
    changeMemos:function(type){
      if(type===0){
        this.named = false;
        this.anonymous = true;
      }else{
        this.named = true;
        this.anonymous = false;
      }
    }
  }
})
